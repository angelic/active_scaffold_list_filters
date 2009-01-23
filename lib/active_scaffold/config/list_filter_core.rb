module ListFilterCore
  def self.included(base)
    base.extend(ClassMethods)
  end
  
  module ClassMethods
    ActionController::Resources::Resource::ACTIVE_SCAFFOLD_ROUTING[:collection][:list_filter] = :get
  end
end

ActiveScaffold::Config::Core.send(:include, ListFilterCore)