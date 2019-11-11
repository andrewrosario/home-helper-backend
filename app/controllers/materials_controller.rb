class MaterialsController < ApplicationController
    def find_all_and_render
        @materials = Material.all.where('project_id = ?', params[:material][:project_id]).order(:id)
        render json: @materials
    end

    def create
        @material = Material.create(material_params)
        project_id = params[:material][:project_id]
        find_all_and_render()
    end

    def destroy
        @material = Material.find(params[:id])
        project_id = @material.project.id
        @material.destroy
        find_all_and_render()
    end

    def update
        @material = Material.find(params[:id])
        @material.update(material_params)
        find_all_and_render()
    end

    private

    def material_params
        params.require(:material).permit(:amount, :amount_unit, :cost, :link, :name, :project_id)
    end
end
