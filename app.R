#* Echo back the input
#* @param msg The message to echo
#* @get /api/echo
function(msg=""){
  list(msg = paste0("The message is: '", msg, "'"))
}

# EXAMPLE 1
#* Confirmation Message
#* @get /testing
#* @serializer text
function(msg=""){
  "My R Service Deployed!"
}
