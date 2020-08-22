package main

import (
	"fmt"
	"strings"
)

var numbersMap map[string]string

func main() {

}

func convertAmount(amount string) string {
	populateNumbersMap()

	amountSplit := strings.Split(amount, ".")
	amountSplit[0] = strings.ReplaceAll(amountSplit[0], ",", "")
	integral := strings.Repeat("0", 9-len(amountSplit[0])) + amountSplit[0]
	decimal := amountSplit[1]

	millions := convertThreeDigitNumber(integral[:3])
	thousands := convertThreeDigitNumber(integral[3:6])
	rest := convertThreeDigitNumber(integral[6:9])

	pounds := ""
	if len(millions) > 0 {
		pounds += fmt.Sprintf("%s million ", millions)
	}
	if len(thousands) > 0 {
		pounds += fmt.Sprintf("%s thousand ", thousands)
	}
	if len(rest) > 0 {
		pounds += fmt.Sprintf("%s ", rest)
	}

	pence := convertTwoDigitNumber(decimal)

	result := fmt.Sprintf("%spounds", pounds)
	if len(pence) > 0 {
		result += fmt.Sprintf(" and %s pence", pence)
	}
	return strings.ToUpper(result[:1]) + result[1:]
}

func convertTwoDigitNumber(n string) string {
	if nStr, ok := numbersMap[n]; ok {
		return nStr
	}
	var tens string
	if n[:1] == "0" {
		tens = ""
	} else {
		tens = numbersMap[n[:1]+"0"]
	}
	units := numbersMap[n[1:2]]

	if len(tens) > 0 {
		return fmt.Sprintf("%s %s", tens, units)
	} else {
		return units
	}
}

func convertThreeDigitNumber(n string) string {
	if n == "000" {
		return ""
	} else if n[:1] == "0" {
		return convertTwoDigitNumber(n[1:])
	} else {
		hundreds := numbersMap[n[:1]]
		rest := convertTwoDigitNumber(n[1:])

		if len(rest) > 0 {
			return fmt.Sprintf("%s hundred %s", hundreds, rest)
		} else {
			return fmt.Sprintf("%s hundred", hundreds)
		}
	}
}

func populateNumbersMap() {
	numbersMap = map[string]string{
		"00": "",
		"0":  "",
		"1":  "one",
		"2":  "two",
		"3":  "three",
		"4":  "four",
		"5":  "five",
		"6":  "six",
		"7":  "seven",
		"8":  "eight",
		"9":  "nine",
		"10": "ten",
		"11": "eleven",
		"12": "twelve",
		"13": "thirteen",
		"14": "fourteen",
		"15": "fifteen",
		"16": "sixteen",
		"17": "seventeen",
		"18": "eighteen",
		"19": "nineteen",
		"20": "twenty",
		"30": "thirty",
		"40": "forty",
		"50": "fifty",
		"60": "sixty",
		"70": "seventy",
		"80": "eighty",
		"90": "ninety",
	}
}
