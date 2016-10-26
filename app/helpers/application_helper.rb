module ApplicationHelper

  def active_for_button(object)
    # this looks counterintuitive, sorry! It's a view helper method to show the correct text on the button to mark a user active/inactive from the users index page for an admin.
    if object.active
      return "inactive"
    else
      return "active"
    end
  end

end
