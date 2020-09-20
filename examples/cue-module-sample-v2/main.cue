import "github.com/ryoya-fujimoto/proto/device"

_someDevice1: device.#Device & {
  id: 1
  user: {
    email: "user1@example.com"
    name: "user1"
  }
}
_someDevice2: device.#Device & {
  id: 2
  user: {
    email: "user2@example.com"
    name: "user2"
  }
}

for i, d in [_someDevice1, _someDevice2] {
	"device_\(i)": {
		for k, v in d {
			"\(k)": v
		}
		for k, v in d.user {
			"\(k)": v
		}
	}
}
