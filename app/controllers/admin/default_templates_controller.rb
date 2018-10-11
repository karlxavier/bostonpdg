class Admin::DefaultTemplatesController < ApplicationController
  before_action :set_default_template, only: [:edit, :update, :show]

  def index

  end

  def show

  end

  def edit

  end

  def update
      respond_to do |format|
        if @default_template.update_attributes(default_template_params)
          format.html { redirect_to admin_default_templates_path }
        else
          format.html { render 'edit' }
        end
      end
  end

  private

    def default_template_params
      params.require(:default_template).permit(:message)
    end

    def set_default_template
      @default_template = DefaultTemplate.find(params[:id])
    end

end
