
texinfo_register_global_direction('Index', '@code{append}ix');
texinfo_register_global_direction('NewB', 'chapter');
texinfo_register_text_direction('Toto');
texinfo_register_text_direction('Titi');
texinfo_register_text_direction('Up');

texinfo_register_direction_string_info('NewB', 'text', undef, '@emph{Another} Button');
texinfo_register_direction_string_info('Titi', 'text', '<a href="https://myhomepage.example.com/">Home</a>', undef, 'normal');
texinfo_register_direction_string_info('Titi', 'text', 'Home myhomepage.example.com', undef, 'string');

1;
