a: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

b: [ for x in a {x * 10}] // HL
c: [ for x in a if x mod 2 == 0 {x}] // HL

if len(b) > 5 {d: "1~5"} // HL
e: len(b)
