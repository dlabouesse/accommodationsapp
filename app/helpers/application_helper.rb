module ApplicationHelper
    def signed_in?
        if session[:user_id].nil?
            return
        else
            @current_user = User.find_by_id(session[:user_id])
        end
    end

    def pronoun(dataitem)
        if dataitem == "Mr"
            @pronoun = "his"
        else
            @pronoun = "her"
        end
        @pronoun
    end

    def getPropertiesInDublin
        properties=Property.near("Dublin",10)

        @markers =""
        properties.each do |prop|
            @markers = @markers+"&markers="+prop.latitude.to_s+","+prop.longitude.to_s
        end
        @markers
    end
end
