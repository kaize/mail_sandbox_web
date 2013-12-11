angular.module('app.helpers.messages_filter', [])
  .factory "messagesFilterHelper", ($rootScope) ->

    filterDateFormat = (filterDate) ->
      date = new Date(filterDate)

      day   =   date.getDate()
      month =   date.getMonth() + 1
      year  =   date.getFullYear()

      filterDateFormatted = day + '-' + month + '-' + year

    filterParamsFilling: (messagesFilterMask) ->
      ransack_params = {
        'q[subject_cont]'                 : messagesFilterMask.subject,
        'q[recipient_in]'                 : messagesFilterMask.recipient,
        'q[sender_in]'                    : messagesFilterMask.sender,
        'q[completed_at_casted_date_eq]'  : filterDateFormat(messagesFilterMask.completed_at)
        'q[state_in]'                     : messagesFilterMask.state
      }

