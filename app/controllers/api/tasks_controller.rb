# frozen_string_literal: true

module API
  class TasksController < ApiController
    before_action :find_entity, only: %i[update destroy]

    def create
      task = Task.new(post_params)
      if task.save
        render json: task, status: 201
      else
        render json: task.errors, status: 422
      end
    end

    def update
      if @task.update(put_params)
        render json: @task, status: 200
      else
        render json: @task.errors, status: 422
      end
    end

    def destroy
      head(204) if @task.destroy
    end

    private

    def find_entity
      head(404) unless (@task = Task.find_by(id: params.require(:id)))
    end

    def post_params
      params.require(:task).permit(:title, :done)
    end

    def put_params
      params.require(:task).permit(:title, :done)
    end
  end
end
