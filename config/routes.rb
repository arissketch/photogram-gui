Rails.application.routes.draw do

  get("/", {:controller =>"users", :action => "listusers"})

  get("/users", {:controller =>"users", :action=>"listusers"})
  get("/users/:username",{:controller =>"users", :action=>"showuser"})
  post("/add_user",{:controller =>"users", :action=>"add"})
  post("/update_user/:username",{:controller=>"users", :action=>"updateuser"})
  
  get("/photos/:id",{:controller=>"photos",:action=>"showphoto"})
  post("/update_photo/:id",{:controller=>"photos", :action=>"updatephoto"})
  get("/delete_photo/:id",{:controller=>"photos", :action=>"deletephoto"})
  get("/photos",{:controller=>"photos",:action=>"listphotos"})
  post("/insert_photo_record",{:controller=>"photos",:action=>"addphoto"})

  post("/add_comment",{:controller=>"photos", :action=>"addcomment"})


end
