/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_lstmap.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rkassouf <rkassouf@student.42abudhabi.a    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/03/09 16:20:48 by rkassouf          #+#    #+#             */
/*   Updated: 2022/03/10 12:39:58 by rkassouf         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

t_list	*ft_lstmap(t_list *lst, void *(*f)(void *), void (*del)(void *))
{
	t_list	*new_list;
	t_list	*buf;

	if (!lst)
		return (NULL);
	new_list = NULL;
	while (lst)
	{
		buf = ft_lstnew(f(lst->content));
		if (!buf)
		{
			ft_lstclear(&new_list, del);
			return (NULL);
		}
		ft_lstadd_back(&new_list, buf);
		lst = lst->next;
	}
	return (new_list);
}
