# @class NotAllowedError
# should be raised when something in not allowed. For example initialization of some object is not allowed under
# certain condition. Or may be record save is not allowed because of some logic.
class OrderError < AppBaseError; end