# Hospital Management Analytics --- DAX Calculated Columns

Calculated columns are evaluated row by row during model refresh. Unlike
measures, they do not automatically recalculate for each visual's filter
context.

## 1. Patient Age Group

Table: `patients_clean`

``` dax
Age Group =
SWITCH(
    TRUE(),
    ISBLANK(patients_clean[age]), "Unknown",
    patients_clean[age] <= 18, "0–18",
    patients_clean[age] <= 35, "19–35",
    patients_clean[age] <= 50, "36–50",
    patients_clean[age] <= 65, "51–65",
    "66+"
)
```

Groups patients by age.

### Age Group Sort

``` dax
Age Group Sort =
SWITCH(
    patients_clean[Age Group],
    "0–18", 1,
    "19–35", 2,
    "36–50", 3,
    "51–65", 4,
    "66+", 5,
    "Unknown", 6,
    99
)
```

Select `Age Group`, then choose **Column tools → Sort by column → Age
Group Sort**.

## 2. Appointment Weekday

Table: `appointments_clean`

``` dax
Appointment Weekday =
FORMAT(appointments_clean[appointment_date], "dddd")
```

Displays weekday names.

### Weekday Sort

``` dax
Weekday Sort =
WEEKDAY(appointments_clean[appointment_date], 2)
```

With return type `2`, Monday = 1 and Sunday = 7. Sort
`Appointment Weekday` by `Weekday Sort`.

## 3. Bill Amount Band

Table: `billing_clean`

``` dax
Bill Amount Band =
VAR Amount = billing_clean[total_amount]
RETURN
SWITCH(
    TRUE(),
    ISBLANK(Amount), "Unknown",
    Amount < 500, "Below 500",
    Amount < 2000, "500–1,999",
    Amount < 5000, "2,000–4,999",
    "5,000 and above"
)
```

Groups billing rows by amount range. These bands are report categories,
not official accounting categories.

### Bill Amount Band Sort

``` dax
Bill Amount Band Sort =
SWITCH(
    billing_clean[Bill Amount Band],
    "Below 500", 1,
    "500–1,999", 2,
    "2,000–4,999", 3,
    "5,000 and above", 4,
    "Unknown", 5,
    99
)
```

Sort `Bill Amount Band` by `Bill Amount Band Sort`. If amounts are at
bill-line level, the bands describe rows rather than unique bills.

## 4. Length of Stay Band

Table: `admissions_clean`

``` dax
Length of Stay Band =
SWITCH(
    TRUE(),
    ISBLANK(admissions_clean[length_of_stay]), "Unknown",
    admissions_clean[length_of_stay] <= 1, "1 day",
    admissions_clean[length_of_stay] <= 3, "2–3 days",
    admissions_clean[length_of_stay] <= 7, "4–7 days",
    "8+ days"
)
```

Groups admissions by recorded length of stay.

### Optional Length of Stay Band Sort

``` dax
Length of Stay Band Sort =
SWITCH(
    admissions_clean[Length of Stay Band],
    "1 day", 1,
    "2–3 days", 2,
    "4–7 days", 3,
    "8+ days", 4,
    "Unknown", 5,
    99
)
```

Sort `Length of Stay Band` by `Length of Stay Band Sort`.

## Setup Checks

1.  Create each column in the specified table.
2.  Verify column names against the final PBIX model.
3.  Set each Sort by column option as described.
4.  Confirm date fields have Date or Date/Time data types before
    deriving weekday labels.
5.  Review blank and out-of-range values.
6.  Use a dedicated Calendar table for time intelligence where
    appropriate.
