class PersonObserver < ActiveRecord::Observer

  def after_save(model)
    clear_caches
  end

  def after_destroy(model)
    clear_caches
  end

  def clear_caches
    puts %{

      CLEARING CACHE FROM THE OBSERVER

    }
    Rails.cache.delete('people-all')
  end

end
