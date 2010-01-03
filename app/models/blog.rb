class Blog < ActiveRecord::Base
    has_many :body_photos
    validates_presence_of :body

    def self.posts_for_month_by_date(year, month)
        retval = { }
        Blog.all(:group=>"date(created_at)", :order=>"created_at").each do |blog|
            retval[blog.created_at.mday] = blog
        end
        retval
    end

    def self.posts_for_year(year)
        retval = { }
        Blog.all(:group=>"date(created_at)", :order=>"created_at").each do |blog|
            if (!retval.has_key?(blog.created_at.month))
                retval[blog.created_at.month] = [ ]
            end
            retval[blog.created_at.month] << blog
        end

        retval
    end

    def contains_stats?
        contains_body_composition? or contains_measurements? or contains_energy?
    end

    def contains_body_composition?
        weight.present? or bodyfat.present?
    end

    def contains_measurements?
        waist.present? or chest.present? or hips.present?
    end

    def contains_energy?
        ate_primal or calories_burned.present? or calories_eaten.present? or hours_slept.present?
    end

    def self.last_n_sleep_entries(count)
        retval = [ ]
        if (count.present?)
            Blog.find(:all, :conditions=>["hours_slept > 0"], :order=>"created_at", :limit=>count).each do |blog|
                retval << Float(blog.hours_slept)
            end
        else
            Blog.find(:all, :conditions=>["hours_slept > 0"], :order=>"created_at").each do |blog|
                retval << Float(blog.hours_slept)
            end
        end

        retval
    end

    def self.last_n_calories_eaten_entries(count)
        retval = [ ]
        if (count.present?)
            Blog.find(:all, :conditions=>["calories_eaten > 0"], :order=>"created_at", :limit=>count).each do |blog|
                retval << Integer(blog.calories_eaten)
            end
        else
            Blog.find(:all, :conditions=>["calories_eaten > 0"], :order=>"created_at").each do |blog|
                retval << Integer(blog.calories_eaten)
            end
        end

        retval
    end

    def self.last_n_calories_burned_entries(count)
        retval = [ ]
        if (count.present?)
            Blog.find(:all, :conditions=>["calories_burned > 0"], :order=>"created_at", :limit=>count).each do |blog|
                retval << Integer(blog.calories_burned)
            end
        else
            Blog.find(:all, :conditions=>["calories_burned > 0"], :order=>"created_at").each do |blog|
                retval << Integer(blog.calories_burned)
            end
        end

        retval
    end

    def self.last_n_calories_difference_entries(count)
        retval = [ ]
        if (count.present?)
            Blog.find(:all, :conditions=>["calories_burned > 0 and calories_eaten > 0"], :order=>"created_at", :limit=>count).each do |blog|
                retval << (Integer(blog.calories_eaten) - Integer(blog.calories_burned))
            end
        else
            Blog.find(:all, :conditions=>["calories_burned > 0 and calories_eaten > 0"], :order=>"created_at").each do |blog|
                retval << (Integer(blog.calories_eaten) - Integer(blog.calories_burned))
            end
        end

        retval
    end

    def self.last_n_waist_entries(count)
        retval = [ ]
        if (count.present?)
            Blog.find(:all, :conditions=>["waist > 0"], :order=>"created_at", :limit=>count).each do |blog|
                retval << Integer(blog.waist)
            end
        else
            Blog.find(:all, :conditions=>["waist > 0"], :order=>"created_at").each do |blog|
                retval << Integer(blog.waist)
            end
        end

        retval
    end

    def self.last_n_chest_entries(count)
        retval = [ ]
        if (count.present?)
            Blog.find(:all, :conditions=>["chest > 0"], :order=>"created_at", :limit=>count).each do |blog|
                retval << Integer(blog.chest)
            end
        else
            Blog.find(:all, :conditions=>["chest > 0"], :order=>"created_at").each do |blog|
                retval << Integer(blog.chest)
            end
        end

        retval
    end

    def self.last_n_hips_entries(count)
        retval = [ ]
        if (count.present?)
            Blog.find(:all, :conditions=>["hips > 0"], :order=>"created_at", :limit=>count).each do |blog|
                retval << Integer(blog.hips)
            end
        else
            Blog.find(:all, :conditions=>["hips > 0"], :order=>"created_at").each do |blog|
                retval << Integer(blog.hips)
            end
        end

        retval
    end

    def self.last_n_weight_entries(count)
        retval = [ ]
        if (count.present?)
            Blog.find(:all, :conditions=>["weight > 0"], :order=>"created_at", :limit=>count).each do |blog|
                retval << Float(blog.weight)
            end
        else
            Blog.find(:all, :conditions=>["weight > 0"], :order=>"created_at").each do |blog|
                retval << Float(blog.weight)
            end
        end

        retval
     end

    def self.last_n_bodyfat_entries(count)
        retval = [ ]
        if (count.present?)
            Blog.find(:all, :conditions=>["bodyfat > 0"], :order=>"created_at", :limit=>count).each do |blog|
                retval << Float(blog.bodyfat)
            end
        else
            Blog.find(:all, :conditions=>["bodyfat > 0"], :order=>"created_at").each do |blog|
                retval << Float(blog.bodyfat)
            end
        end

        retval
     end

end
