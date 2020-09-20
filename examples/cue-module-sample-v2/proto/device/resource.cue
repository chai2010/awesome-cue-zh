package device

import user_1 "github.com/ryoya-fujimoto/proto/user"

#Device: {
	id?:   uint64       @protobuf(1)
	user?: user_1.#User @protobuf(2,type=user.User)
}
