# frozen_string_literal: true
ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do

    columns do
      column do
        form action: admin_dashboard_path, id:"filter-form" do
          div class: 'form-inputs dashboard-search' do
            div id:"reportrange" do
              i class:"fa fa-calendar"
              span
              i class:"fa fa-caret-down"
              input type: 'hidden', name: 'datepicker', id:"datepicker-id"
            end
            # div class:'from-filter' do
            #   label "From"
            #   input type: 'date', name: 'from', id:'from', data: { behavior: 'daterangepicker' }
            # end

            # div class:'to-filter' do
            #   label "To"
            #   input type: 'date', name: 'to', id:'to'
            # end

            div class:'submit-btn' do
              input type: 'submit', value: 'Filter', class:'submit-filter', id: 'filter-button'
            end
          end
          div class:'error'
        end
      end
    end
    columns do
      column do
        panel "Recent Events" do
          render "admin/dashboard/card"
        end
      end
    end

    columns do
      column do
        panel "Analytics" do
          columns do
            column do
              panel "Category Analytics", style:"text-align: center;" do
                div do
                  pie_chart category_chart.group(:name).count, download: true, colors: ["#C69749", "#5F264A", "#FB2576", "#3A1078", "#46C2CB"]
                end
              end
            end

            column do
              panel "User Analytics", style:"text-align: center;" do
                div do
                  pie_chart users.group(:created_at).count, download: true
                end
              end
            end
          end
        end
      end
    end
  end

  controller do
    def index
      if params[:datepicker].present?
        date = params[:datepicker].split("-")
        params[:from] = date[0].to_datetime
        params[:to] = date[1].to_datetime
      end
      # where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day //daily
      # where(created_at: Time.zone.now.beginning_of_month..Time.zone.now.end_of_month) //monthly
      # where(created_at: Time.zone.now.beginning_of_year..Time.zone.now.end_of_year) //yearly
      @item_details = ItemDetail.all
      @users = User.all
      @categories = Category.all
      @category_chart = Category.joins(:item_details)
      if params[:from].present? && params[:to].present?
        from_and_to(params[:from],params[:to])
      elsif params[:day].present?
        day_wise(params[:day])
      end
    end

    private

    def from_and_to(from, to)
      @item_details = @item_details.where('created_at >= ? AND created_at <= ?', from, to)
      @users = @users.where('created_at >= ? AND created_at <= ?', from, to)
      @categories = @categories.where('created_at >= ? AND created_at <= ?', from, to)
      @category_chart = @category_chart.where('item_details.created_at >= ? AND item_details.created_at <= ?', from, to)
    end

    def day_wise(day)
      @item_details = @item_details.where('created_at >= ? AND created_at <= ?', from, to)
      @users = @users.where('created_at >= ? AND created_at <= ?', from, to)
      @categories = @categories.where('created_at >= ? AND created_at <= ?', from, to)
      @category_chart = @category_chart.where('item_details.created_at >= ? AND item_details.created_at <= ?', from, to)
    end
  end
end
