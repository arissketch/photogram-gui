class PhotosController <ApplicationController
  def showphoto
    render({:template => "photos/show"})
  end
end
