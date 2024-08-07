package main

// The following struct is unified with all elements in job.
// The name of each element is bound to Name and visible in the struct.
job: [Name=_]: {
    name:     "Name"
    replicas: uint | *1
    command:  string
    // Name: "aaa" // cannot have both alias and field with name "Name" in same scope:
    "\(Name)": Name
}

job: list: command: "ls"

job: nginx: {
    command:  "nginx"
    replicas: 2
}