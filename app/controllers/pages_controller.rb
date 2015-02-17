class PagesController < ApplicationController
  def home
      @properties=Property.near("Dublin",10)

      @markers =""
      @properties.each do |prop|
          @markers = @markers+"&markers="+prop.latitude.to_s+","+prop.longitude.to_s
      end
  end

  def about
  end
end
