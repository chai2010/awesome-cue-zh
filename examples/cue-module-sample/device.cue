import "github.com/ryoya-fujimoto/device"

someDevice: device.Device & {
  id: 1
  user: {
    email: "user@example.com"
    name: "user1"
  }
}
