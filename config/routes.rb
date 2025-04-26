Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'user_programs/index'
    end
  end

  namespace :api do
    namespace :v1 do
      get 'user_programs/create'
    end
  end

  namespace :api do
    namespace :v1 do
      get 'user_activities/create'
    end
  end

  namespace :api do
    namespace :v1 do
      get 'user_activities/update'
    end
  end

  namespace :api do
    namespace :v1 do
      get 'daily_plans/index'
    end
  end

  namespace :api do
    namespace :v1 do
      get 'daily_plans/show'
    end
  end

  namespace :api do
    namespace :v1 do
      get 'activities/index'
    end
  end

  namespace :api do
    namespace :v1 do
      get 'activities/show'
    end
  end

  namespace :api do
    namespace :v1 do
      get 'programs/index'
    end
  end

  namespace :api do
    namespace :v1 do
      get 'programs/show'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
