class Admin::StatisticsController < Admin::BaseController
    def index
      @totalUsers = User.count
      @totalBooks = Book.count
      @totalSubjects = Subject.count
      @totalCategories = Category.count

      @adminList = User.where("role = 0")
    end
  end
  