module Icm::IncidentJournalsHelper
  def prepare_request_files(incident_request)
    # file belongs to journal
    @request_files = Irm::AttachmentVersion.query_all.query_by_incident_request(incident_request.id).group_by{|a| a.source_id}
    # file belongs to request
    files_belong_to_request = Irm::AttachmentVersion.query_incident_request_file((incident_request.id))

    @request_files.merge!({0=>files_belong_to_request})

  end

  def list_request_file

    return if @request_files[0].nil?||@request_files[0].size<1
    file_lists = ""
    @request_files[0].each do |f|
      file_lists << show_file(f)
    end
    content_tag(:div,file_lists.html_safe,{:class=>"fileList"})
  end

  def list_journals(incident_request)
    journals = Icm::IncidentJournal.list_all(incident_request.id)
    render :partial=>"icm/incident_journals/list_journals",:locals=>{:journals=>journals,:grouped_files=>@request_files}
  end

  def list_journal_files(grouped_files,journal)
    return if grouped_files[journal.id].nil?||grouped_files[journal.id].size<1
    file_lists = ""
    grouped_files[journal.id].each do |f|
      file_lists << show_file(f)
    end
     content_tag(:div,file_lists.html_safe,{:class=>"fileList"})
  end

  # show file
  def show_file(f)
    image_path = nil
    image_path = f.data.url(:thumb) if f.image?
    image_path = theme_image_path(Irm::AttachmentVersion.file_type_icon(f.data.original_filename)) unless image_path
    link = "<a target='_blank' href='#{f.data.url}' stats=""><img  class='fileIcon' src='#{image_path}'></a>"
    description = "<span title='#{f.data.original_filename||f.description}' class='fileDesc'>#{f.description||f.data.original_filename}</span>"
    content_tag(:div, (link.html_safe + description.html_safe).html_safe,{:class=>"fileItem"}).html_safe
  end

  def process_message(msg)
    file_names = msg.scan(/!([a-zA-Z\d\-_]+\.[a-z]+)!/)
    file_names.each do |file_name_array|
      file_name = file_name_array[0]
      @request_files.each do |key,files|
        file = files.detect{|f| f.data.original_filename.eql?(file_name)}
        if(file&&file.image?)
          msg = msg.gsub(/!#{file_name}!/,"<img  class='msg' src='#{file.data.url}'/>")
          break
        end
      end
    end
    msg
  end

  def incident_close_code
    close = Icm::IncidentStatus.enabled.query_by_close_flag(Irm::Constant::SYS_YES).first
    close ||= {:incident_status_code=>"CLOSE_STATUS"}
    close[:incident_status_code]
  end

  def available_close_code
    Icm::CloseReason.multilingual.collect{|i|[i[:name],i[:close_code]]}
  end

  def replied_avatar(journal)
    if(journal[:avatar_file_name])
      Irm::Person.avatar_url({:id=>journal[:replied_by],:updated_at=>journal[:avatar_updated_at],:filename=>journal[:avatar_file_name]},:medium)
    else
      "/images/default_medium_avatar.jpg"
    end
  end

  def person_avatar(person_id)
    person = Irm::Person.find(person_id)
    if person&&person.avatar_file_name
      person.avatar.url(:medium)
    else
      "/images/default_medium_avatar.jpg"
    end

  end


end
