module Irm
  module Jobs
    class IrmLdapSynJob<Struct.new(:syn_header_id)
      def perform
        # 查找需要处理的事件
        syn_header = Irm::LdapSynHeader.find(syn_header_id)
        if !syn_header.nil? then
          syn_header.ldap_syn
          syn_header.process_syn_data
        end

      end
    end
  end
end