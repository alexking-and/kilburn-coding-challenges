package main

import "testing"

func TestConvertAmount(t *testing.T) {
	cases := []struct {
		in, out string
	}{
		{"10,216,360.11", "Ten million two hundred sixteen thousand three hundred sixty pounds and eleven pence"},
		{"654,552.00", "Six hundred fifty four thousand five hundred fifty two pounds"},
		{"28,222.18", "Twenty eight thousand two hundred twenty two pounds and eighteen pence"},
		{"10.00", "Ten pounds"},
		{"999.99", "Nine hundred ninety nine pounds and ninety nine pence"},
	}
	for _, c := range cases {
		result := convertAmount(c.in)
		if result != c.out {
			t.Errorf("convertAmount(%q) == %q, expected %q", c.in, result, c.out)
		}
	}
}
