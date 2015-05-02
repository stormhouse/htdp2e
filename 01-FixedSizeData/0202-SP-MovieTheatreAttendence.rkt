;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 0202-SP-MovieTheatreAttendence) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")))))
; Sample Problem - Movie Theatre Attendence
;
; Imagine the owner of a monopolistic movie theater. He has complete freedom 
; in setting ticket prices. The more he charges, the fewer the people who can
; afford tickets. The less he charges, the more it costs to run a show because 
; attendance goes up. In a recent experiment the owner determined a 
; relationship between the price of a ticket and average attendance.
;
; At a price of $5.00 per ticket, 120 people attend a performance. 
; For each 10-cent change in the ticket price, the average attendance changes 
; by 15 people. That is, if the owner charges $5.10, some 105 people attend on
; the average; if the prices goes down to $4.90, average attendance increases 
; to 135. Let us translate this idea into a mathematical formula: 
;     avg attendence = 120 - change in price / 0.10 * 15 people
; Unfortunately, the increased attendance also comes at an increased cost. 
; Every performance comes at a fixed costs of $180 to the owner plus a variable
; cost of $0.04 per attendee.
;
; The owner would like to know the exact relationship between profit and ticket
; price so that he maximize his profit.

; # of attendees is based on ticket price
(define (attendees ticket-price)  
  (- 120 (* (- ticket-price 5.0) (/ 15 0.1))))

; revenue generated by ticket sales
(define (revenue ticket-price) 
  (* ticket-price (attendees ticket-price)))

; cost has a fixed part ($180) and a variable part ($0.04 * # of attendees)
(define (cost ticket-price)  
  (+ 180 (* 0.04 (attendees ticket-price))))

; profit
(define (profit ticket-price) 
  (- (revenue ticket-price)     
     (cost ticket-price)))

; example usage
(profit 5.0)
(profit 5.10)
(profit 4.90)


