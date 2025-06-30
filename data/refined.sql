-- get the normalized homeless id value and join it to our anxiety data
with anxiety as (
    select
        hc.id,
        ha.encounter_date,
        ha.anxiety_lvl
    from public.homeless_anxiety as ha
        left join public.hid_control as hc
            on ha.homeless_id = hc.fmt2
),

-- get the normalized homeless id value and join it to our demographics data
demographics as (
    select
        hc.id,
        hd.registration_date,
        hd.first_name,
        hd.last_name,
        hd.middle_name,
        hd.date_of_birth,
        hd.gender,
        hd.race,
        hd.shelter
    from public.homeless_demographics as hd
        left join public.hid_control as hc
            on hd.hid = hc.fmt1
),

-- join our anxiety and demographics data
combined as (
    select
        ax.id as hid_n,
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
order by encounter_date asc, hid_n asc;

-- notes
  -- test/ddl: id, encounter_date, anxiety_lvl, shelter not null
  -- gender, race, shelter should be ENUMs (or smallints + control table) to address issues like
  --    Billy's vs. Billy’s
