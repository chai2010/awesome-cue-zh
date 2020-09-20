import "github.com/ryoya-fujimoto/proto/device"

_someDevice: device.#Device & {
  id: 1
  user: {
    email: "user@example.com"
    name: "user1"
  }
}

for k, v in _someDevice {
    "\(k)": v
}
