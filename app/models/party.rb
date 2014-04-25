class Party < ActiveRecord::Base

  def wait_time
    ((Time.now - created_at)/60).to_i if created_at
  end

end
