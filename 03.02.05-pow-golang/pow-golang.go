package main

import (
    "fmt"
    "net/http"
    "math"
    "strconv"
)

func pow(w http.ResponseWriter, r *http.Request) {
    
    values := r.URL.Query()
        
    base, err := strconv.ParseFloat(values.Get("base"), 64);
    if (err != nil) {
        http.Error(w, "Incorrect base parameter.", http.StatusBadRequest);
        return;
    }
        
    exponent, err := strconv.ParseFloat(values.Get("exponent"), 64);
    if (err != nil) {
        http.Error(w, "Incorrect exponent parameter.", http.StatusBadRequest);
        return;
    }

    fmt.Fprintf(w, "Result: %f\n", math.Pow(base, exponent));
}


func main() {
    http.HandleFunc("/", pow)
    http.ListenAndServe(":8087", nil)
}