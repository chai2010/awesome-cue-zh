package device

import "github.com/ryoya-fujimoto/user"

Device: {
	id?:   uint64      @protobuf(1)
	user?: _user_.User @protobuf(2,type=user.User)
}
let _user_ = user
