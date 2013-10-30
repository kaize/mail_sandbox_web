angular.module('app.helpers.mail_messages', [])
  .factory "mailMessagesHelper", ($rootScope) ->

    ransackParamsFilling: (messageFilterMask) ->
      ransack_params = {
        'q[subject_cont]'    : messageFilterMask.subject,
        'q[recipient_in]'    : messageFilterMask.recipient,
        'q[sender_in]'       : messageFilterMask.sender,
        'q[completed_at_eq]' : messageFilterMask.completed_at,
        'q[state_in]'        : messageFilterMask.state
      }

      ransack_params

