# encoding: utf-8

class SocialController < ApplicationController

  # Require authorization before invoking any of this controller's actions:
  before_filter :authenticate_user!
  # ---------------------------------------------------------------------------


  # Invite friends action.
  #
  # === GET:
  #     Renderes the landing page with the invite form.
  #
  # === POST:
  #     Creates the friendship row with pending status (pending invites will be
  #     automatically shown to a user on its personalized news-feed).
  def invite
    # TODO
  end
  # ---------------------------------------------------------------------------


  # Accept friends action.
  #
  # === GET:
  #     Renderes the landing page with the accept form for editing friendship
  #     parameters.
  #
  # === PUT:
  #     Updates friendship row with the accepted status (creates also a personalized
  #     news feed article).
  def accept
    # TODO
  end
  # ---------------------------------------------------------------------------


  # Block friends action.
  #
  # === GET:
  #     Renderes the landing page with the confirmation form.
  #
  # === PUT:
  #     Updates friendship row with the blocked status (w/o news feed article).
  def block
    # TODO
  end
  # ---------------------------------------------------------------------------


  # Un-block friends action.
  #
  # === GET:
  #     Renderes the landing page with the confirmation form.
  #
  # === PUT:
  #     Updates friendship row clearing the blocked status (w/o news feed article).
  def block
    # TODO
  end
  # ---------------------------------------------------------------------------


  # Remove friendship action.
  #
  # === GET:
  #     Renderes the landing page with the confirmation form.
  #
  # === DELETE:
  #     Removes the friendship row (adding also a news feed article TODO?).
  def remove_friendship
    # TODO
  end
  # ---------------------------------------------------------------------------

end
