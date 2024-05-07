class PhotosController <ApplicationController
  def showphoto
    the_id =params.fetch("id")
    matching_photo=Photo.where({:id=> the_id})
    @the_photo=matching_photo.at(0)
    render({:template => "photos/show"})
  end
end
