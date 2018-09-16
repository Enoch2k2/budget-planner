module Slugifiable
    module ClassMethods
        def find_by_slug(slug)
            self.all.find{|record| record.slug == slug}
        end
    end

    module InstanceMethods
        def slug
            if self.methods.include?(:full_name)
                full_name.split(" ").collect{|name| name.downcase}.join("-") if full_name
            else
                title.split(" ").collect{|name| name.downcase}.join("-") if title
            end
        end
    end
end