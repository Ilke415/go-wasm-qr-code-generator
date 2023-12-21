package main

import (
	b64 "encoding/base64"

	"syscall/js"

	qrcode "github.com/skip2/go-qrcode"
)

func GetQRCode(this js.Value, args []js.Value) interface{} {
	content := args[0].String()
	size := args[1].Int()

	png, err := qrcode.Encode(content, qrcode.Medium, size)
	_ = err
	result := b64.StdEncoding.EncodeToString([]byte(png))

	return result
}

func main() {
	ch := make(chan struct{}, 0)
	js.Global().Set("getQRCode", js.FuncOf(GetQRCode))
	<-ch
}
