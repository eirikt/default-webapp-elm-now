module DateFormatter exposing (format, int2twoDigitString)

import Date
import Time exposing (Month)


{-| Transforms an integer to a string representation;
Left-padded with a zero if it less than 10 (and greater than zero).

    int2TwoDigitString -100 == "-100"

    int2TwoDigitString -10 == "-10"

    int2TwoDigitString -1 == "-1"

    int2TwoDigitString 0 == "00"

    int2TwoDigitString 1 == "01"

    int2TwoDigitString 10 == "10"

    int2TwoDigitString 100 == "100"

-}
int2twoDigitString : Int -> String
int2twoDigitString =
    String.padLeft 2 '0' << String.fromInt


{-| Transforms a UNIX posix time integer to a human readable date.
The resulting date format is: "yyyy-MM-HH hh:mm (UTC)".

    format Nothing == "?"

    format Just -1000000 == "1969-12-31 23:43 (UTC)"

    format Just 0 == "1970-01-01 00:00 (UTC)"

    format Just 1000000000000 == "2001-09-09 01:46 (UTC)"

-}
format : Maybe Int -> String
format maybeTimestamp =
    case maybeTimestamp of
        Just timestampInMilliseconds ->
            let
                posix =
                    Time.millisToPosix timestampInMilliseconds

                year =
                    Time.toYear Time.utc posix |> int2twoDigitString

                month =
                    Time.toMonth Time.utc posix |> Date.monthToNumber |> int2twoDigitString

                day =
                    Time.toDay Time.utc posix |> int2twoDigitString

                hour =
                    Time.toHour Time.utc posix |> int2twoDigitString

                minute =
                    Time.toMinute Time.utc posix |> int2twoDigitString
            in
            --Debug.todo "'DateFormatter.format' not yet implemented"
            --Debug.log "[DEBUG] DateFormatter.format: formattedDateTime" (year ++ "-" ++ month ++ "-" ++ day ++ " " ++ hour ++ ":" ++ minute ++ " (UTC)")
            year ++ "-" ++ month ++ "-" ++ day ++ " " ++ hour ++ ":" ++ minute ++ " (UTC)"

        Nothing ->
            "?"
