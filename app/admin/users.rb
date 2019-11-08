ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :bio,
                :isLock, :isDeleted, :avatar, :role, :username

  index do
    selectable_column
    # id_column
    column :avatar
    column :username
    column :role
    column :email
    column :bio
    # column :current_sign_in_at
    # column :sign_in_count
    column :created_at
    column :isLock
    column :isDeleted
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :isLock
      f.input :avatar
      f.input :username
      f.input :role
      f.input :bio
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :isDeleted
    end
    f.actions
  end
end
