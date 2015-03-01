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
            if prop.advert == nil
                @markers = @markers+"&markers=label:0|"+prop.latitude.to_s+","+prop.longitude.to_s
            else
                @markers = @markers+"&markers=label:"+prop.advert.nb_of_free_beds.to_s+"|"+prop.latitude.to_s+","+prop.longitude.to_s
            end
        end
        @markers
    end
end
