User.delete_all
Room.delete_all

miriam = User.create(email: "miriam@codaisseurbnb.com", password: "abcd1234")

room = Room.create(home_type: "House", room_type: "Shared", accommodate: 2, bedroom_count: 2, bathroom_count: 3, listing_name: "You will never forget your stay!", description: "Normcore meh put a bird on it man braid mumblecore, locavore synth swag kogi helvetica ugh health goth twee raw denim readymade. Freegan yuccie everyday carry tote bag you probably haven't heard of them godard. Meditation tattooed lumbersexual street art truffaut pour-over, kale chips pitchfork. Readymade snackwave man bun, photo booth tilde wolf occupy fashion axe VHS authentic PBR&B typewriter. Vape everyday carry meditation try-hard hammock unicorn.", address: "Colon 58, 1B, 11100 Cadiz (Spain)", has_tv: false, has_kitchen: true, has_airco: false, has_heating: false, has_internet: true, price: 100, active: true, user: miriam)
