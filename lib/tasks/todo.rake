namespace :todo do
  desc "優先度が低句くく、古いtodoを削除"
  task :destroy_old => :environment do
    Todo.where("created_at <= ?", Time.zone.today - 5.days)
    .where("priority <= 1")
    .destroy_all
  end
end
