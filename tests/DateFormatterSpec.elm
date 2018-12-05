module DateFormatterSpec exposing (suite)

import DateFormatter
import Expect exposing (Expectation)
import Test exposing (Test, describe, test)


suite : Test
suite =
    describe "The DateFormatter module"
        [ describe "int2TwoDigitString"
            [ test "should just 'toString' negative integers (1)" <|
                \_ ->
                    -100 |> DateFormatter.int2TwoDigitString |> Expect.equal "-100"
            , test "should just 'toString' negative integers (2)" <|
                \_ ->
                    -10 |> DateFormatter.int2TwoDigitString |> Expect.equal "-10"
            , test "should just 'toString' negative integers (3)" <|
                \_ ->
                    -1 |> DateFormatter.int2TwoDigitString |> Expect.equal "-1"
            , test "should pad zero" <|
                \_ ->
                    0 |> DateFormatter.int2TwoDigitString |> Expect.equal "00"
            , test "should pad single-digit integers" <|
                \_ ->
                    1 |> DateFormatter.int2TwoDigitString |> Expect.equal "01"
            , test "should just 'toString' double-digit integers" <|
                \_ ->
                    10 |> DateFormatter.int2TwoDigitString |> Expect.equal "10"
            , test "should just 'toString' multi-digit integers" <|
                \_ ->
                    100 |> DateFormatter.int2TwoDigitString |> Expect.equal "100"
            ]
        , describe "format"
            [ test "should emit questionmark when no argument" <|
                \_ ->
                    Nothing |> DateFormatter.format |> Expect.equal "?"
            , test "should handle arg as POSIX time/UNIX Epoch time (1)" <|
                \_ ->
                    Just 0 |> DateFormatter.format |> Expect.equal "1970-01-01 00:00 (UTC)"
            , test "should handle arg as POSIX time/UNIX Epoch time (2)" <|
                \_ ->
                    Just 1000000 |> DateFormatter.format |> Expect.equal "1970-01-01 00:16 (UTC)"
            , test "should handle arg as POSIX time/UNIX Epoch time (3)" <|
                \_ ->
                    Just 1000000000000 |> DateFormatter.format |> Expect.equal "2001-09-09 01:46 (UTC)"
            , test "should handle arg as POSIX time/UNIX Epoch time (4)" <|
                \_ ->
                    Just 2000000000000 |> DateFormatter.format |> Expect.equal "2033-05-18 03:33 (UTC)"
            , test "should handle negative arg as POSIX time/UNIX Epoch time" <|
                \_ ->
                    Just -1000000 |> DateFormatter.format |> Expect.equal "1969-12-31 23:43 (UTC)"
            ]
        ]
