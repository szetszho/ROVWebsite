Rails.application.routes.draw do

  scope(module: :user) do
    get('login', to: 'authentication#login')
    post('login', to: 'authentication#login')
    get('logout', to: 'authentication#login')
    get('index', to: 'user#index')
    get('registered_sessions', to: 'user#registered_sessions')
    get('course/register', to: 'course#register', as: :course_register1)
    get('course/register/:course', to: 'course#register', as: :course_register2)
    get('course/register/:course/:session', to: 'course#register', as: :course_register3)
    get('course/cancel/:id', to: 'course#cancel', as: :course_cancel)
    post('course/cancel/:id', to: 'course#cancel')
    post('course/register/:course/:session', to: 'course#register', as: :course_register4)
  end

  scope(module: :admin) do
    get('admin/login', to: 'authentication#login')
    post('admin/login', to: 'authentication#login')
    get('admin/logout', to: 'authentication#logout')
    get('admin/index')
    get('department/insert', as: :insert_department)
    post('department/insert')
    get('department/update/:id', to: 'department#update', as: :update_department)
    post('department/update/:id', to: 'department#update')
    get('department/delete/:id', to: 'department#delete', as: :delete_department)
    post('department/delete/:id', to: 'department#delete')
    get('course/:id', to: 'course#details', as: :course_details , constraints: {id: /[0-9]+/})
    get('course/insert', as: :insert_course)
    post('course/insert')
    get('course/update/:id', to: 'course#update', as: :update_course)
    post('course/update/:id', to: 'course#update')
    get('course/delete/:id', to: 'course#delete', as: :delete_course)
    post('course/delete/:id', to: 'course#delete')
    get('session/:id', to: 'session#details', as: :session_details)
    get('member/insert', as: :insert_member)
    post('member/insert')
    get('member/update/:id', to: 'member#update', as: :update_member)
    post('member/update/:id', to: 'member#update')
    get('member/delete/:id', to: 'member#delete', as: :delete_member)
    post('member/delete/:id', to: 'member#delete')
  end

  root(to: 'user/authentication#login')

end
