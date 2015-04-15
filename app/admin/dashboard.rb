ActiveAdmin.register_page "Dashboard" do

  menu false

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end

    columns do
      column do
        panel "Recent Disclosures" do
          ul do
            FinanceDisclosure.all.limit(5).map do |finance_disclosure|
              li link_to(finance_disclosure.submitted, admin_finance_disclosure_path(finance_disclosure))
            end
          end
        end
      end
    end
  end # content

end
