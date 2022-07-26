/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_split.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rkassouf <rkassouf@student.42abudhabi.ae>  +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/03/03 09:03:42 by rkassouf          #+#    #+#             */
/*   Updated: 2022/07/26 20:46:45 by rkassouf         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

static int	ft_separator(char a, char c)
{
	if (a == c || a == '\0')
		return (1);
	return (0);
}

static size_t	ft_wordcount(char const *s, char c)
{
	size_t	len;
	size_t	wc;
	size_t	i;

	wc = 0;
	i = 0;
	len = ft_strlen(s);
	while (i < len)
	{
		if (ft_separator(s[i], c) == 0 && ft_separator(s[i + 1], c) == 1)
			wc++;
		i++;
	}
	return (wc);
}

void	ft_free_split(char **split)
{
	int	i;

	i = 0;
	while (split[i] != NULL)
	{
		free(split[i]);
		i++;
	}
	free(split);
	split = NULL;
}

char	**ft_split(char const *s, char c)
{
	size_t	i;
	size_t	wc;
	size_t	size;
	char	**split;

	if (!s)
		return (NULL);
	wc = ft_wordcount(s, c);
	split = malloc((wc + 1) * sizeof(char *));
	if (split == NULL)
		return (NULL);
	i = 0;
	while (i < wc)
	{
		size = 0;
		while (ft_separator(*s, c) && *s != '\0')
			s++;
		while (ft_separator(s[size], c) == 0)
			size++;
		split[i] = ft_substr(s, 0, size);
		s += size;
		i++;
	}
	split[i] = NULL;
	return (split);
}
