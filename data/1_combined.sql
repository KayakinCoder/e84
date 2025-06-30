-- get the normalized homeless id value and join it to our anxiety data
with anxiety as (
    select
        hid.id,
        ha.encounter_date,
        ha.anxiety_lvl
    from public."0_ha" as ha
        left join public."0_hid" as hid
            on ha.homeless_id = hid.fmt2
),

-- get the normalized homeless id value and join it to our demographics data
demographics as (
    select
        hid.id,
        hd.registration_date,
        hd.first_name,
        hd.last_name,
        hd.middle_name,
        hd.date_of_birth,
        hd.gender,
        hd.race,
        hd.shelter
    from public."0_hd" as hd
        left join public."0_hid" as hid
            on hd.hid = hid.fmt1
),

-- join our anxiety and demographics data
combined as (
    select
        ax.id as hid,
        ax.encounter_date,
        ax.anxiety_lvl,
        dm.registration_date,
        dm.first_name,
        dm.last_name,
        dm.middle_name,
        dm.date_of_birth,
        dm.gender,
        dm.race,
        dm.shelter
    from anxiety as ax
        left join demographics as dm
            on ax.id = dm.id
)

select * from combined
order by encounter_date asc, hid asc;

-- notes
  -- test/ddl: id, encounter_date, anxiety_lvl, shelter not null
  -- gender, race, shelter should be ENUMs (or smallints + control table) to address issues like
  --    Billy's vs. Billy’s
