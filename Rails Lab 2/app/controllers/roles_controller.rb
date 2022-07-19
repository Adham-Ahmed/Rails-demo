class RolesController < ApplicationController
  before_action :set_role, only: %i[ show edit update destroy ]
    @roles = Role.all
  end

  end

    @role = Role.new
  end
    authorize! :edit, @role

  end
    @role = Role.new(role_params)
    respond_to do |format|
      if @role.save
        format.html { redirect_to role_url(@role), notice: "Role was successfully created." }
        format.json { render :show, status: :created, location: @role }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

    respond_to do |format|
      if @role.update(role_params)
        format.html { redirect_to role_url(@role), notice: "Role was successfully updated." }
        format.json { render :show, status: :ok, location: @role }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @role.destroy

    respond_to do |format|
      format.html { redirect_to roles_url, notice: "Role was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_role
      @role = Role.find(params[:id])
    end

    def role_params
      params.require(:role).permit(:name, :description)
    end
end
