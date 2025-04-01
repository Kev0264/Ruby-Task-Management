class TaskNotificationWorker
    # TODO: Fix this
    # include Sidekiq::Worker
    # sidekiq_options queue: 'high_priority', retry: 3
  
    def perform(task_id)
      task = Task.find(task_id)
      TaskMailer.with(task: task).due_soon.deliver_now
    rescue ActiveRecord::RecordNotFound => e
        Rails.logger.error "Task not found: #{e.message}"
    end
end