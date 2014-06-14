$("#registrations").ready ->
  $.externalScript("https://js.stripe.com/v2/").done (script, textStatus) ->
    Stripe.setPublishableKey $("meta[name=\"stripe-key\"]").attr("content")
    subscription =
      setupForm: ->
        $("#upgrade_form").submit ->
          $("input[type=submit]").prop "disabled", true
          if $("#card_number").length
            subscription.processCard()
            false
          else
            true

      processCard: ->
        card = undefined
        card =
          name: $("#card_name").val()
          number: $("#card_number").val()
          cvc: $("#card_code").val()
          expMonth: $("#card_month").val()
          expYear: $("#card_year").val()

        Stripe.createToken card, subscription.handleStripeResponse

      handleStripeResponse: (status, response) ->
        if status is 200
          $("#stripe_token").val response.id
          $("#upgrade_form")[0].submit()
        else
          $("#stripe_error").text(response.error.message).show()
          $("input[type=submit]").prop "disabled", false
        return

    subscription.setupForm()

  return

# $("#registrations").ready ->
#   $.externalScript("https://js.stripe.com/v2/").done (script, textStatus) ->
#     unless typeof Stripe is "undefined"
#       console.log "Stripe JavaScript file loaded."
#     else
#       console.log "Problem: Stripe JavaScript file not loaded."
#     Stripe.setPublishableKey $("meta[name=\"stripe-key\"]").attr("content")
#     console.log "set Stripe public key: " + $("meta[name=\"stripe-key\"]").attr("content")
#     subscription =
#       setupForm: ->
#         console.log "function: setupForm"
#         $("#new_user").submit ->
#           console.log "setupForm: form submitted"
#           $("input[type=submit]").prop "disabled", true
#           subscription.processCard()
#           false

#       processCard: ->
#         console.log "function: processCard"
#         card = undefined
#         card =
#           name: $("#card_name").val()
#           number: $("#card_number").val()
#           cvc: $("#card_code").val()
#           expMonth: $("#card_month").val()
#           expYear: $("#card_year").val()

#         Stripe.createToken card, subscription.handleStripeResponse

#       handleStripeResponse: (status, response) ->
#         console.log "function: handleStripeResponse"
#         if status is 200
#           alert "Stripe response: " + response.id
#         else
#           alert "Stripe response: " + response.error.message

#     subscription.setupForm()

#   return

