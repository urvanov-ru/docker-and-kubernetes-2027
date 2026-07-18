// Простейший http-сервис возведения в степень.
// https:/urvanov.ru
package main

import (
    "fmt"
    "net/http"
    "math"
    "strconv"
)

// Простейший обработчик запросов.
// Считывает входные параметры из URL и 
// пишет результат в ответ сервера.
func pow(w http.ResponseWriter, r *http.Request) {
    
    values := r.URL.Query()
    
    // Считываем основание в float64.
    base, err := strconv.ParseFloat(values.Get("base"), 64);
    if (err != nil) {
        http.Error(w, "Incorrect base parameter.",
                http.StatusBadRequest);
        return;
    }
    
    // Считываем степень в float64.
    exponent, err := strconv.ParseFloat(
            values.Get("exponent"), 64);
    if (err != nil) {
        http.Error(w, "Incorrect exponent parameter.",
                http.StatusBadRequest);
        return;
    }

    // Пишем в качестве ответа сервера результат возведения
    // в степень.
    fmt.Fprintf(w, "Result: %f\n", math.Pow(base, exponent));
}

// Стартовая точка программы.
func main() {
    fmt.Println("Usage example:")
    fmt.Println("http://localhost:8087?base=2&exponent=3")
    http.HandleFunc("/", pow)
    http.ListenAndServe(":8087", nil)
}