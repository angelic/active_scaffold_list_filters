class Association < ActiveScaffold::DataStructures::ListFilter

	# Return a list of conditions based on the params 
	def conditions(params)
		association = association_tree[association_tree.size - 1]
    table = ActiveRecord::Base.connection.quote_table_name(association.active_record.table_name)
		column = ActiveRecord::Base.connection.quote_column_name(association.primary_key_name)
		return ["#{table}.#{column} IN (?)", params]
	end
	
	def association_tree()
		arr ||= association_tree_from_array(@core.model, @options[:association]).reverse
		return arr
	end
	
	private
	
	def association_tree_from_array(model, association_array)
		arr = []
		association_array.each do |model_name|
			association = model.reflect_on_all_associations.detect {|assoc| assoc.name.to_s == model_name.to_s}
			arr << association
			model = association.klass
		end
		return arr.reverse
	end
	
end
