class PhotosController <ApplicationController
  def showphoto
    the_id =params.fetch("id")
    matching_photo=Photo.where({:id=> the_id})
    @the_photo=matching_photo.at(0)
    render({:template => "photos/show"})
  end
  def deletephoto
    the_id = params.fetch("id")
    matching_records = Photo.where({ :id => the_id })
    the_photo = matching_records.at(0)
    the_photo.destroy
    redirect_to("/photos")
  end

  def updatephoto
    # Get the ID out of params
    the_id = params.fetch("id")

    # Look up the existing record
    matching_records = Photo.where({ :id => the_id })
    the_photo = matching_records.at(0)

    # Overwrite each column with the values from user inputs
    the_photo.caption = params.fetch("input_caption")
    the_photo.image = params.fetch("input_image")

    # Save
    the_photo.save

    # Redirect to the movie details page
    redirect_to("/photos/#{the_photo.id}")

  end
  def listphotos
    all_photos=Photo.all
    @list_of_photos=all_photos.order({:created_at=> :desc})
    render({:template=>"photos/list"})
  end
  def addphoto
    photo=Photo.new
    photo.image=params.fetch("input_image")
    photo.caption=params.fetch("input_caption")
    photo.owner_id=params.fetch("input_owner_id")
    photo.save

    redirect_to("/photos/#{photo.id}")

  end

  def addcomment
    c=Comment.new
    c.photo_id=params.fetch("input_photo_id")
    c.body=params.fetch("input_comment")
    c.author_id=params.fetch("input_author_id")
    c.save
    redirect_to("/photos/#{c.photo_id}")

  end

end
