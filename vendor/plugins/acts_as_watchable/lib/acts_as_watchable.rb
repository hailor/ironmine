# ActsAsWatchable
module Ironmine
  module Acts
    module Watchable
      def self.included(base)
        base.extend ClassMethods
      end

      module ClassMethods
        def acts_as_watchable(options = {})
          return if self.included_modules.include?(Ironmine::Acts::Watchable::InstanceMethods)
          send :include, Ironmine::Acts::Watchable::InstanceMethods

          class_eval do
            has_many :watchers, :as => :watchable, :dependent => :delete_all, :class_name => "Irm::Watcher"
            has_many :person_watchers, :through => :watchers, :source => :member ,:source_type=>"#{Irm::Person.name}"
#            has_many :role_watchers, :through => :watchers, :source => :member ,:source_type=>"#{Irm::Role.name}"
            scope :watchables_by_person,lambda{|person_id|
              joins(:person_watchers).
              where("#{Irm::Watcher.table_name}.member_id=?",person_id)
            }

#            scope :watchables_by_role_person,lambda{|person_id|
#              joins(:role_watchers).
#              joins("JOIN #{Irm::RoleMember.table_name} on #{Irm::RoleMember.table_name}.role_id = #{Irm::Watcher.table_name}.member_id").
#              where("#{Irm::RoleMember.table_name}.person_id=?",person_id)
#            }
          end
        end
      end

      module InstanceMethods
        def self.included(base)
          base.extend ClassMethods
        end

        # Adds member as a watcher
        def add_watcher(member)
          self.watchers << Irm::Watcher.new(:member_id => member.id,:member_type=>member.class.name)
        end

        # Removes member from the watchers list
        def remove_watcher(member)
          Irm::Watcher.delete_all "watchable_type = '#{self.class}' AND watchable_id = #{self.id} AND memeber_type='#{memeber.class.name}' AND memeber_id = #{member.id}"
        end

        # Adds/removes watcher
        def set_watcher(member, watching=true)
          watching ? add_watcher(member) : remove_watcher(member)
        end


        # Returns an array of watchers' email addresses
        def watcher_recipients          
          all_person_watchers.collect{|person| person.email_address}.compact
        end

        def all_person_watchers
          notified = []+person_watchers
          notified.uniq!
          notified.reject! {|person| !person.enabled?}
          notified
        end

        def watched_by?(person)
          person_watchers.exists?(person.id)
        end

        module ClassMethods
          # Returns the objects that are watched by user
          def watched_by(person_id)
            watchables = watchables_by_person(person_id) #+watchables_by_role_person(person_id)
            watchables.uniq!
            watchables
          end
        end
      end
    end
  end
end